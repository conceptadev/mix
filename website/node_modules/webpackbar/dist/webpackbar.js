'use strict';

const webpack = require('webpack');
const env = require('std-env');
const prettyTime = require('pretty-time');
const path2 = require('path');
const chalk2 = require('chalk');
const Consola = require('consola');
const textTable = require('text-table');
const figures = require('figures');
const ansiEscapes = require('ansi-escapes');
const wrapAnsi = require('wrap-ansi');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

const env__default = /*#__PURE__*/_interopDefaultLegacy(env);
const prettyTime__default = /*#__PURE__*/_interopDefaultLegacy(prettyTime);
const path2__default = /*#__PURE__*/_interopDefaultLegacy(path2);
const chalk2__default = /*#__PURE__*/_interopDefaultLegacy(chalk2);
const Consola__default = /*#__PURE__*/_interopDefaultLegacy(Consola);
const textTable__default = /*#__PURE__*/_interopDefaultLegacy(textTable);
const ansiEscapes__default = /*#__PURE__*/_interopDefaultLegacy(ansiEscapes);
const wrapAnsi__default = /*#__PURE__*/_interopDefaultLegacy(wrapAnsi);

function first(arr) {
  return arr[0];
}
function last(arr) {
  return arr.length ? arr[arr.length - 1] : null;
}
function startCase(str) {
  return str[0].toUpperCase() + str.substr(1);
}
function firstMatch(regex, str) {
  const m = regex.exec(str);
  return m ? m[0] : null;
}
function hasValue(s) {
  return s && s.length;
}
function removeAfter(delimiter, str) {
  return first(str.split(delimiter)) || "";
}
function removeBefore(delimiter, str) {
  return last(str.split(delimiter)) || "";
}
function range(len) {
  const arr = [];
  for (let i = 0; i < len; i++) {
    arr.push(i);
  }
  return arr;
}
function shortenPath(path2$1 = "") {
  const cwd = process.cwd() + path2.sep;
  return String(path2$1).replace(cwd, "");
}
function objectValues(obj) {
  return Object.keys(obj).map((key) => obj[key]);
}

const nodeModules = `${path2.delimiter}node_modules${path2.delimiter}`;
const BAR_LENGTH = 25;
const BLOCK_CHAR = "\u2588";
const BLOCK_CHAR2 = "\u2588";
const NEXT = " " + chalk2__default['default'].blue(figures.pointerSmall) + " ";
const BULLET = figures.bullet;
const TICK = figures.tick;
const CROSS = figures.cross;
const CIRCLE_OPEN = figures.radioOff;

const consola = Consola__default['default'].withTag("webpackbar");
const colorize = (color) => {
  if (color[0] === "#") {
    return chalk2__default['default'].hex(color);
  }
  return chalk2__default['default'][color] || chalk2__default['default'].keyword(color);
};
const renderBar = (progress, color) => {
  const w = progress * (BAR_LENGTH / 100);
  const bg = chalk2__default['default'].white(BLOCK_CHAR);
  const fg = colorize(color)(BLOCK_CHAR2);
  return range(BAR_LENGTH).map((i) => i < w ? fg : bg).join("");
};
function createTable(data) {
  return textTable__default['default'](data, {
    align: data[0].map(() => "l")
  }).replace(/\n/g, "\n\n");
}
function ellipsisLeft(str, n) {
  if (str.length <= n - 3) {
    return str;
  }
  return `...${str.substr(str.length - n - 1)}`;
}

const parseRequest = (requestStr) => {
  const parts = (requestStr || "").split("!");
  const file = path2__default['default'].relative(process.cwd(), removeAfter("?", removeBefore(nodeModules, parts.pop())));
  const loaders = parts.map((part) => firstMatch(/[a-z0-9-@]+-loader/, part)).filter(hasValue);
  return {
    file: hasValue(file) ? file : null,
    loaders
  };
};
const formatRequest = (request) => {
  const loaders = request.loaders.join(NEXT);
  if (!loaders.length) {
    return request.file || "";
  }
  return `${loaders}${NEXT}${request.file}`;
};
function hook(compiler, hookName, fn) {
  if (compiler.hooks) {
    compiler.hooks[hookName].tap("WebpackBar:" + hookName, fn);
  } else {
    compiler.plugin(hookName, fn);
  }
}

const originalWrite = Symbol("webpackbarWrite");
class LogUpdate {
  constructor() {
    this.prevLineCount = 0;
    this.listening = false;
    this.extraLines = "";
    this._onData = this._onData.bind(this);
    this._streams = [process.stdout, process.stderr];
  }
  render(lines) {
    this.listen();
    const wrappedLines = wrapAnsi__default['default'](lines, this.columns, {
      trim: false,
      hard: true,
      wordWrap: false
    });
    const data = ansiEscapes__default['default'].eraseLines(this.prevLineCount) + wrappedLines + "\n" + this.extraLines;
    this.write(data);
    this.prevLineCount = data.split("\n").length;
  }
  get columns() {
    return (process.stderr.columns || 80) - 2;
  }
  write(data) {
    const stream = process.stderr;
    if (stream.write[originalWrite]) {
      stream.write[originalWrite].call(stream, data, "utf-8");
    } else {
      stream.write(data, "utf-8");
    }
  }
  clear() {
    this.done();
    this.write(ansiEscapes__default['default'].eraseLines(this.prevLineCount));
  }
  done() {
    this.stopListen();
    this.prevLineCount = 0;
    this.extraLines = "";
  }
  _onData(data) {
    const str = String(data);
    const lines = str.split("\n").length - 1;
    if (lines > 0) {
      this.prevLineCount += lines;
      this.extraLines += data;
    }
  }
  listen() {
    if (this.listening) {
      return;
    }
    for (const stream of this._streams) {
      if (stream.write[originalWrite]) {
        continue;
      }
      const write = (data, ...args) => {
        if (!stream.write[originalWrite]) {
          return stream.write(data, ...args);
        }
        this._onData(data);
        return stream.write[originalWrite].call(stream, data, ...args);
      };
      write[originalWrite] = stream.write;
      stream.write = write;
    }
    this.listening = true;
  }
  stopListen() {
    for (const stream of this._streams) {
      if (stream.write[originalWrite]) {
        stream.write = stream.write[originalWrite];
      }
    }
    this.listening = false;
  }
}

const logUpdate = new LogUpdate();
let lastRender = Date.now();
class FancyReporter {
  allDone() {
    logUpdate.done();
  }
  done(context) {
    this._renderStates(context.statesArray);
    if (context.hasErrors) {
      logUpdate.done();
    }
  }
  progress(context) {
    if (Date.now() - lastRender > 50) {
      this._renderStates(context.statesArray);
    }
  }
  _renderStates(statesArray) {
    lastRender = Date.now();
    const renderedStates = statesArray.map((c) => this._renderState(c)).join("\n\n");
    logUpdate.render("\n" + renderedStates + "\n");
  }
  _renderState(state) {
    const color = colorize(state.color);
    let line1;
    let line2;
    if (state.progress >= 0 && state.progress < 100) {
      line1 = [
        color(BULLET),
        color(state.name),
        renderBar(state.progress, state.color),
        state.message,
        `(${state.progress || 0}%)`,
        chalk2__default['default'].grey(state.details[0] || ""),
        chalk2__default['default'].grey(state.details[1] || "")
      ].join(" ");
      line2 = state.request ? " " + chalk2__default['default'].grey(ellipsisLeft(formatRequest(state.request), logUpdate.columns)) : "";
    } else {
      let icon = " ";
      if (state.hasErrors) {
        icon = CROSS;
      } else if (state.progress === 100) {
        icon = TICK;
      } else if (state.progress === -1) {
        icon = CIRCLE_OPEN;
      }
      line1 = color(`${icon} ${state.name}`);
      line2 = chalk2__default['default'].grey("  " + state.message);
    }
    return line1 + "\n" + line2;
  }
}

class SimpleReporter {
  start(context) {
    consola.info(`Compiling ${context.state.name}`);
  }
  change(context, {shortPath}) {
    consola.debug(`${shortPath} changed.`, `Rebuilding ${context.state.name}`);
  }
  done(context) {
    const {hasError, message, name} = context.state;
    consola[hasError ? "error" : "success"](`${name}: ${message}`);
  }
}

const DB = {
  loader: {
    get: (loader) => startCase(loader)
  },
  ext: {
    get: (ext) => `${ext} files`,
    vue: "Vue Single File components",
    js: "JavaScript files",
    sass: "SASS files",
    scss: "SASS files",
    unknown: "Unknown files"
  }
};
function getDescription(category, keyword) {
  if (!DB[category]) {
    return startCase(keyword);
  }
  if (DB[category][keyword]) {
    return DB[category][keyword];
  }
  if (DB[category].get) {
    return DB[category].get(keyword);
  }
  return "-";
}

function formatStats(allStats) {
  const lines = [];
  Object.keys(allStats).forEach((category) => {
    const stats = allStats[category];
    lines.push(`> Stats by ${chalk2__default['default'].bold(startCase(category))}`);
    let totalRequests = 0;
    const totalTime = [0, 0];
    const data = [
      [startCase(category), "Requests", "Time", "Time/Request", "Description"]
    ];
    Object.keys(stats).forEach((item) => {
      const stat = stats[item];
      totalRequests += stat.count || 0;
      const description2 = getDescription(category, item);
      totalTime[0] += stat.time[0];
      totalTime[1] += stat.time[1];
      const avgTime = [stat.time[0] / stat.count, stat.time[1] / stat.count];
      data.push([
        item,
        stat.count || "-",
        prettyTime__default['default'](stat.time),
        prettyTime__default['default'](avgTime),
        description2
      ]);
    });
    data.push(["Total", totalRequests, prettyTime__default['default'](totalTime), "", ""]);
    lines.push(createTable(data));
  });
  return `${lines.join("\n\n")}
`;
}

class Profiler {
  constructor() {
    this.requests = [];
  }
  onRequest(request) {
    if (!request) {
      return;
    }
    if (this.requests.length) {
      const lastReq = this.requests[this.requests.length - 1];
      if (lastReq.start) {
        lastReq.time = process.hrtime(lastReq.start);
        delete lastReq.start;
      }
    }
    if (!request.file || !request.loaders.length) {
      return;
    }
    this.requests.push({
      request,
      start: process.hrtime()
    });
  }
  getStats() {
    const loaderStats = {};
    const extStats = {};
    const getStat = (stats, name) => {
      if (!stats[name]) {
        stats[name] = {
          count: 0,
          time: [0, 0]
        };
      }
      return stats[name];
    };
    const addToStat = (stats, name, count, time) => {
      const stat = getStat(stats, name);
      stat.count += count;
      stat.time[0] += time[0];
      stat.time[1] += time[1];
    };
    this.requests.forEach(({request, time = [0, 0]}) => {
      request.loaders.forEach((loader) => {
        addToStat(loaderStats, loader, 1, time);
      });
      const ext = request.file && path2__default['default'].extname(request.file).substr(1);
      addToStat(extStats, ext && ext.length ? ext : "unknown", 1, time);
    });
    return {
      ext: extStats,
      loader: loaderStats
    };
  }
  getFormattedStats() {
    return formatStats(this.getStats());
  }
}

class ProfileReporter {
  progress(context) {
    if (!context.state.profiler) {
      context.state.profiler = new Profiler();
    }
    context.state.profiler.onRequest(context.state.request);
  }
  done(context) {
    if (context.state.profiler) {
      context.state.profile = context.state.profiler.getFormattedStats();
      delete context.state.profiler;
    }
  }
  allDone(context) {
    let str = "";
    for (const state of context.statesArray) {
      const color = colorize(state.color);
      if (state.profile) {
        str += color(`
Profile results for ${chalk2__default['default'].bold(state.name)}
`) + `
${state.profile}
`;
        delete state.profile;
      }
    }
    process.stderr.write(str);
  }
}

class StatsReporter {
  constructor(options) {
    this.options = Object.assign({
      chunks: false,
      children: false,
      modules: false,
      colors: true,
      warnings: true,
      errors: true
    }, options);
  }
  done(context, {stats}) {
    const str = stats.toString(this.options);
    if (context.hasErrors) {
      process.stderr.write("\n" + str + "\n");
    } else {
      context.state.statsString = str;
    }
  }
  allDone(context) {
    let str = "";
    for (const state of context.statesArray) {
      if (state.statsString) {
        str += "\n" + state.statsString + "\n";
        delete state.statsString;
      }
    }
    process.stderr.write(str);
  }
}

const reporters = /*#__PURE__*/Object.freeze({
  __proto__: null,
  fancy: FancyReporter,
  basic: SimpleReporter,
  profile: ProfileReporter,
  stats: StatsReporter
});

const DEFAULTS = {
  name: "webpack",
  color: "green",
  reporters: env__default['default'].minimalCLI ? ["basic"] : ["fancy"],
  reporter: null
};
const DEFAULT_STATE = {
  start: null,
  progress: -1,
  done: false,
  message: "",
  details: [],
  request: null,
  hasErrors: false
};
const globalStates = {};
class WebpackBarPlugin extends webpack.ProgressPlugin {
  constructor(options) {
    super({activeModules: true});
    this.options = Object.assign({}, DEFAULTS, options);
    this.handler = (percent, message, ...details) => {
      this.updateProgress(percent, message, details);
    };
    const _reporters = Array.from(this.options.reporters || []).concat(this.options.reporter).filter(Boolean).map((reporter) => {
      if (Array.isArray(reporter)) {
        return {reporter: reporter[0], options: reporter[1]};
      }
      if (typeof reporter === "string") {
        return {reporter};
      }
      return {reporter};
    });
    this.reporters = _reporters.map(({reporter, options: options2 = {}}) => {
      if (typeof reporter === "string") {
        if (this.options[reporter] === false) {
          return;
        }
        options2 = {...this.options[reporter], ...options2};
        reporter = reporters[reporter] || require(reporter);
      }
      if (typeof reporter === "function") {
        try {
          reporter = new reporter(options2);
        } catch (err) {
          reporter = reporter(options2);
        }
      }
      return reporter;
    }).filter(Boolean);
  }
  callReporters(fn, payload = {}) {
    for (const reporter of this.reporters) {
      if (typeof reporter[fn] === "function") {
        try {
          reporter[fn](this, payload);
        } catch (e) {
          process.stdout.write(e.stack + "\n");
        }
      }
    }
  }
  get hasRunning() {
    return objectValues(this.states).some((state) => !state.done);
  }
  get hasErrors() {
    return objectValues(this.states).some((state) => state.hasErrors);
  }
  get statesArray() {
    return objectValues(this.states).sort((s1, s2) => s1.name.localeCompare(s2.name));
  }
  get states() {
    return globalStates;
  }
  get state() {
    return globalStates[this.options.name];
  }
  _ensureState() {
    if (!this.states[this.options.name]) {
      this.states[this.options.name] = {
        ...DEFAULT_STATE,
        color: this.options.color,
        name: startCase(this.options.name)
      };
    }
  }
  apply(compiler) {
    if (compiler.webpackbar) {
      return;
    }
    compiler.webpackbar = this;
    super.apply(compiler);
    hook(compiler, "afterPlugins", () => {
      this._ensureState();
    });
    hook(compiler, "compile", () => {
      this._ensureState();
      Object.assign(this.state, {
        ...DEFAULT_STATE,
        start: process.hrtime()
      });
      this.callReporters("start");
    });
    hook(compiler, "invalid", (fileName, changeTime) => {
      this._ensureState();
      this.callReporters("change", {
        path: fileName,
        shortPath: shortenPath(fileName),
        time: changeTime
      });
    });
    hook(compiler, "done", (stats) => {
      this._ensureState();
      if (this.state.done) {
        return;
      }
      const hasErrors = stats.hasErrors();
      const status = hasErrors ? "with some errors" : "successfully";
      const time = this.state.start ? " in " + prettyTime__default['default'](process.hrtime(this.state.start), 2) : "";
      Object.assign(this.state, {
        ...DEFAULT_STATE,
        progress: 100,
        done: true,
        message: `Compiled ${status}${time}`,
        hasErrors
      });
      this.callReporters("progress");
      this.callReporters("done", {stats});
      if (!this.hasRunning) {
        this.callReporters("beforeAllDone");
        this.callReporters("allDone");
        this.callReporters("afterAllDone");
      }
    });
  }
  updateProgress(percent = 0, message = "", details = []) {
    const progress = Math.floor(percent * 100);
    const activeModule = details.pop();
    Object.assign(this.state, {
      progress,
      message: message || "",
      details,
      request: parseRequest(activeModule)
    });
    this.callReporters("progress");
  }
}

module.exports = WebpackBarPlugin;

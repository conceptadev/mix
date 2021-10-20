"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.getContentPathList = exports.linkify = exports.generateBlogPosts = exports.generateBlogFeed = exports.parseBlogFileName = exports.getBlogTags = exports.getSourceToPermalink = exports.truncate = void 0;
const tslib_1 = require("tslib");
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const chalk_1 = tslib_1.__importDefault(require("chalk"));
const path_1 = tslib_1.__importDefault(require("path"));
const reading_time_1 = tslib_1.__importDefault(require("reading-time"));
const feed_1 = require("feed");
const lodash_1 = require("lodash");
const utils_1 = require("@docusaurus/utils");
const blogFrontMatter_1 = require("./blogFrontMatter");
const authors_1 = require("./authors");
function truncate(fileString, truncateMarker) {
    return fileString.split(truncateMarker, 1).shift();
}
exports.truncate = truncate;
function getSourceToPermalink(blogPosts) {
    return lodash_1.mapValues(lodash_1.keyBy(blogPosts, (item) => item.metadata.source), (v) => v.metadata.permalink);
}
exports.getSourceToPermalink = getSourceToPermalink;
function getBlogTags(blogPosts) {
    const groups = utils_1.groupTaggedItems(blogPosts, (blogPost) => blogPost.metadata.tags);
    return lodash_1.mapValues(groups, (group) => {
        return {
            name: group.tag.label,
            items: group.items.map((item) => item.id),
            permalink: group.tag.permalink,
        };
    });
}
exports.getBlogTags = getBlogTags;
const DATE_FILENAME_REGEX = /^(?<date>\d{4}[-/]\d{1,2}[-/]\d{1,2})[-/]?(?<text>.*?)(\/index)?.mdx?$/;
function parseBlogFileName(blogSourceRelative) {
    const dateFilenameMatch = blogSourceRelative.match(DATE_FILENAME_REGEX);
    if (dateFilenameMatch) {
        const dateString = dateFilenameMatch.groups.date;
        const text = dateFilenameMatch.groups.text;
        // Always treat dates as UTC by adding the `Z`
        const date = new Date(`${dateString}Z`);
        const slugDate = dateString.replace(/-/g, '/');
        const slug = `/${slugDate}/${text}`;
        return { date, text, slug };
    }
    else {
        const text = blogSourceRelative.replace(/(\/index)?\.mdx?$/, '');
        const slug = `/${text}`;
        return { date: undefined, text, slug };
    }
}
exports.parseBlogFileName = parseBlogFileName;
function formatBlogPostDate(locale, date) {
    try {
        return new Intl.DateTimeFormat(locale, {
            day: 'numeric',
            month: 'long',
            year: 'numeric',
            timeZone: 'UTC',
        }).format(date);
    }
    catch (e) {
        throw new Error(`Can't format blog post date "${date}"`);
    }
}
async function generateBlogFeed(contentPaths, context, options) {
    if (!options.feedOptions) {
        throw new Error('Invalid options: "feedOptions" is not expected to be null.');
    }
    const { siteConfig } = context;
    const blogPosts = await generateBlogPosts(contentPaths, context, options);
    if (!blogPosts.length) {
        return null;
    }
    const { feedOptions, routeBasePath } = options;
    const { url: siteUrl, baseUrl, title, favicon } = siteConfig;
    const blogBaseUrl = utils_1.normalizeUrl([siteUrl, baseUrl, routeBasePath]);
    const updated = (blogPosts[0] && blogPosts[0].metadata.date) ||
        new Date('2015-10-25T16:29:00.000-07:00');
    const feed = new feed_1.Feed({
        id: blogBaseUrl,
        title: feedOptions.title || `${title} Blog`,
        updated,
        language: feedOptions.language,
        link: blogBaseUrl,
        description: feedOptions.description || `${siteConfig.title} Blog`,
        favicon: favicon ? utils_1.normalizeUrl([siteUrl, baseUrl, favicon]) : undefined,
        copyright: feedOptions.copyright,
    });
    function toFeedAuthor(author) {
        // TODO ask author emails?
        // RSS feed requires email to render authors
        return { name: author.name, link: author.url };
    }
    blogPosts.forEach((post) => {
        const { id, metadata: { title: metadataTitle, permalink, date, description, authors }, } = post;
        feed.addItem({
            title: metadataTitle,
            id,
            link: utils_1.normalizeUrl([siteUrl, permalink]),
            date,
            description,
            author: authors.map(toFeedAuthor),
        });
    });
    return feed;
}
exports.generateBlogFeed = generateBlogFeed;
async function parseBlogPostMarkdownFile(blogSourceAbsolute) {
    const result = await utils_1.parseMarkdownFile(blogSourceAbsolute, {
        removeContentTitle: true,
    });
    return {
        ...result,
        frontMatter: blogFrontMatter_1.validateBlogPostFrontMatter(result.frontMatter),
    };
}
async function processBlogSourceFile(blogSourceRelative, contentPaths, context, options, authorsMap) {
    var _a, _b, _c, _d, _e;
    const { siteConfig: { baseUrl }, siteDir, i18n, } = context;
    const { routeBasePath, truncateMarker, showReadingTime, editUrl } = options;
    // Lookup in localized folder in priority
    const blogDirPath = await utils_1.getFolderContainingFile(getContentPathList(contentPaths), blogSourceRelative);
    const blogSourceAbsolute = path_1.default.join(blogDirPath, blogSourceRelative);
    const { frontMatter, content, contentTitle, excerpt, } = await parseBlogPostMarkdownFile(blogSourceAbsolute);
    const aliasedSource = utils_1.aliasedSitePath(blogSourceAbsolute, siteDir);
    if (frontMatter.draft && process.env.NODE_ENV === 'production') {
        return undefined;
    }
    if (frontMatter.id) {
        console.warn(chalk_1.default.yellow(`"id" header option is deprecated in ${blogSourceRelative} file. Please use "slug" option instead.`));
    }
    const parsedBlogFileName = parseBlogFileName(blogSourceRelative);
    async function getDate() {
        // Prefer user-defined date.
        if (frontMatter.date) {
            return new Date(frontMatter.date);
        }
        else if (parsedBlogFileName.date) {
            return parsedBlogFileName.date;
        }
        // Fallback to file create time
        return (await fs_extra_1.default.stat(blogSourceAbsolute)).birthtime;
    }
    const date = await getDate();
    const formattedDate = formatBlogPostDate(i18n.currentLocale, date);
    const title = (_b = (_a = frontMatter.title) !== null && _a !== void 0 ? _a : contentTitle) !== null && _b !== void 0 ? _b : parsedBlogFileName.text;
    const description = (_d = (_c = frontMatter.description) !== null && _c !== void 0 ? _c : excerpt) !== null && _d !== void 0 ? _d : '';
    const slug = frontMatter.slug || parsedBlogFileName.slug;
    const permalink = utils_1.normalizeUrl([baseUrl, routeBasePath, slug]);
    function getBlogEditUrl() {
        const blogPathRelative = path_1.default.relative(blogDirPath, path_1.default.resolve(blogSourceAbsolute));
        if (typeof editUrl === 'function') {
            return editUrl({
                blogDirPath: utils_1.posixPath(path_1.default.relative(siteDir, blogDirPath)),
                blogPath: utils_1.posixPath(blogPathRelative),
                permalink,
                locale: i18n.currentLocale,
            });
        }
        else if (typeof editUrl === 'string') {
            const isLocalized = blogDirPath === contentPaths.contentPathLocalized;
            const fileContentPath = isLocalized && options.editLocalizedFiles
                ? contentPaths.contentPathLocalized
                : contentPaths.contentPath;
            const contentPathEditUrl = utils_1.normalizeUrl([
                editUrl,
                utils_1.posixPath(path_1.default.relative(siteDir, fileContentPath)),
            ]);
            return utils_1.getEditUrl(blogPathRelative, contentPathEditUrl);
        }
        return undefined;
    }
    const tagsBasePath = utils_1.normalizeUrl([baseUrl, options.routeBasePath, 'tags']); // make this configurable?
    const authors = authors_1.getBlogPostAuthors({ authorsMap, frontMatter });
    return {
        id: (_e = frontMatter.slug) !== null && _e !== void 0 ? _e : title,
        metadata: {
            permalink,
            editUrl: getBlogEditUrl(),
            source: aliasedSource,
            title,
            description,
            date,
            formattedDate,
            tags: utils_1.normalizeFrontMatterTags(tagsBasePath, frontMatter.tags),
            readingTime: showReadingTime ? reading_time_1.default(content).minutes : undefined,
            truncated: (truncateMarker === null || truncateMarker === void 0 ? void 0 : truncateMarker.test(content)) || false,
            authors,
        },
    };
}
async function generateBlogPosts(contentPaths, context, options) {
    const { include, exclude } = options;
    if (!fs_extra_1.default.existsSync(contentPaths.contentPath)) {
        return [];
    }
    const blogSourceFiles = await utils_1.Globby(include, {
        cwd: contentPaths.contentPath,
        ignore: exclude,
    });
    const authorsMap = await authors_1.getAuthorsMap({
        contentPaths,
        authorsMapPath: options.authorsMapPath,
    });
    const blogPosts = lodash_1.compact(await Promise.all(blogSourceFiles.map(async (blogSourceFile) => {
        try {
            return await processBlogSourceFile(blogSourceFile, contentPaths, context, options, authorsMap);
        }
        catch (e) {
            console.error(chalk_1.default.red(`Processing of blog source file failed for path "${blogSourceFile}"`));
            throw e;
        }
    })));
    blogPosts.sort((a, b) => b.metadata.date.getTime() - a.metadata.date.getTime());
    return blogPosts;
}
exports.generateBlogPosts = generateBlogPosts;
function linkify({ filePath, contentPaths, fileString, siteDir, sourceToPermalink, onBrokenMarkdownLink, }) {
    const { newContent, brokenMarkdownLinks } = utils_1.replaceMarkdownLinks({
        siteDir,
        fileString,
        filePath,
        contentPaths,
        sourceToPermalink,
    });
    brokenMarkdownLinks.forEach((l) => onBrokenMarkdownLink(l));
    return newContent;
}
exports.linkify = linkify;
// Order matters: we look in priority in localized folder
function getContentPathList(contentPaths) {
    return [contentPaths.contentPathLocalized, contentPaths.contentPath];
}
exports.getContentPathList = getContentPathList;

import { execFileSync } from 'node:child_process';
import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const scriptDir = path.dirname(fileURLToPath(import.meta.url));
const defaultWorkspaceRoot = path.resolve(scriptDir, '../../../..');

const SHOWCASE_SOURCE_PATHS = [
  '.fvmrc',
  'pubspec.yaml',
  'pubspec.lock',
  'packages/mix_annotations/lib',
  'packages/mix_annotations/pubspec.yaml',
  'packages/mix/lib',
  'packages/mix/pubspec.yaml',
  'packages/mix_tailwinds/lib',
  'packages/mix_tailwinds/pubspec.yaml',
  'packages/mix_tailwinds/example/assets',
  'packages/mix_tailwinds/example/lib',
  'packages/mix_tailwinds/example/pubspec.yaml',
  'packages/mix_tailwinds/example/real_tailwind',
  'packages/mix_tailwinds/example/web',
  'packages/mix_tailwinds/tool/visual-comparison/package.json',
  'packages/mix_tailwinds/tool/visual-comparison/package-lock.json',
  'packages/mix_tailwinds/tool/visual-comparison/run-advanced-comparison.mjs',
  'packages/mix_tailwinds/tool/visual-comparison/run-visual-comparison.mjs',
  'packages/mix_tailwinds/tool/visual-comparison/showcase-provenance.mjs',
];
const SHOWCASE_ADDITIONAL_FILES = [
  'packages/mix_tailwinds/pubspec_overrides.yaml',
  'packages/mix_tailwinds/example/pubspec_overrides.yaml',
];

// Returns a content fingerprint for every tracked or untracked source that can
// affect the public showcase or its visual-parity evidence.
export function computeShowcaseSourceFingerprint({
  additionalFiles = SHOWCASE_ADDITIONAL_FILES,
  workspaceRoot = defaultWorkspaceRoot,
  sourcePaths = SHOWCASE_SOURCE_PATHS,
} = {}) {
  const output = execFileSync(
    'git',
    [
      'ls-files',
      '--cached',
      '--others',
      '--exclude-standard',
      '--',
      ...sourcePaths,
    ],
    { cwd: workspaceRoot, encoding: 'utf8' },
  );
  const files = new Set(output.split('\n').filter(Boolean));
  for (const relativeFile of additionalFiles) {
    if (fs.existsSync(path.join(workspaceRoot, relativeFile))) {
      files.add(relativeFile);
    }
  }
  if (files.size === 0) {
    throw new Error('No showcase source files were found for provenance.');
  }

  const hash = crypto.createHash('sha256');
  hash.update('mix-tailwinds-showcase-source-v1\0');
  for (const relativeFile of [...files].sort()) {
    const absoluteFile = path.join(workspaceRoot, relativeFile);
    hash.update(relativeFile);
    hash.update('\0');
    hash.update(
      fs.existsSync(absoluteFile) ? fs.readFileSync(absoluteFile) : '<deleted>',
    );
    hash.update('\0');
  }

  return `sha256:${hash.digest('hex')}`;
}

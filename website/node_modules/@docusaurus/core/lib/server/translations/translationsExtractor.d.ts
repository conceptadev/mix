import { TransformOptions } from '@babel/core';
import { InitializedPlugin, TranslationFileContent, TranslationMessage } from '@docusaurus/types';
export declare function globSourceCodeFilePaths(dirPaths: string[]): Promise<string[]>;
export declare function extractSiteSourceCodeTranslations(siteDir: string, plugins: InitializedPlugin[], babelOptions: TransformOptions, extraSourceCodeFilePaths?: string[]): Promise<TranslationFileContent>;
declare type SourceCodeFileTranslations = {
    sourceCodeFilePath: string;
    translations: Record<string, TranslationMessage>;
    warnings: string[];
};
export declare function extractAllSourceCodeFileTranslations(sourceCodeFilePaths: string[], babelOptions: TransformOptions): Promise<SourceCodeFileTranslations[]>;
export declare function extractSourceCodeFileTranslations(sourceCodeFilePath: string, babelOptions: TransformOptions): Promise<SourceCodeFileTranslations>;
export {};

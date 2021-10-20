import { RouteConfig } from '@docusaurus/types';
import { Globby } from '@docusaurus/utils';
export declare function getAllFinalRoutes(routeConfig: RouteConfig[]): RouteConfig[];
export declare function safeGlobby(patterns: string[], options?: Globby.GlobbyOptions): Promise<string[]>;

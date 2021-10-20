/// <reference types="@docusaurus/plugin-content-docs" />
import { GlobalVersion } from '@theme/hooks/useDocs';
export declare function useDocsPreferredVersion(pluginId?: string | undefined): {
    preferredVersion: GlobalVersion | null | undefined;
    savePreferredVersionName: (versionName: string) => void;
};
export declare function useDocsPreferredVersionByPluginId(): Record<string, GlobalVersion | null | undefined>;

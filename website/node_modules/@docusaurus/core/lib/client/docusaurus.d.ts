declare global {
    const __webpack_require__: {
        gca: (name: string) => string;
    };
    interface Navigator {
        connection: {
            effectiveType: string;
            saveData: boolean;
        };
    }
}
declare const docusaurus: {
    prefetch: (routePath: string) => boolean;
    preload: (routePath: string) => boolean;
};
export default docusaurus;

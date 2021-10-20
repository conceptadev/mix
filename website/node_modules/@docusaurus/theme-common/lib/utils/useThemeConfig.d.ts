import { PrismTheme } from 'prism-react-renderer';
import { CSSProperties } from 'react';
export declare type DocsVersionPersistence = 'localStorage' | 'none';
export declare type NavbarItem = {
    type?: string | undefined;
    items?: NavbarItem[];
    label?: string;
    position?: 'left' | 'right';
};
export declare type NavbarLogo = {
    src: string;
    srcDark?: string;
    href?: string;
    target?: string;
    alt?: string;
};
export declare type Navbar = {
    style: 'dark' | 'primary';
    hideOnScroll: boolean;
    title?: string;
    items: NavbarItem[];
    logo?: NavbarLogo;
};
export declare type ColorModeConfig = {
    defaultMode: 'light' | 'dark';
    disableSwitch: boolean;
    respectPrefersColorScheme: boolean;
    switchConfig: {
        darkIcon: string;
        darkIconStyle: CSSProperties;
        lightIcon: string;
        lightIconStyle: CSSProperties;
    };
};
export declare type AnnouncementBarConfig = {
    id: string;
    content: string;
    backgroundColor: string;
    textColor: string;
    isCloseable: boolean;
};
export declare type PrismConfig = {
    theme?: PrismTheme;
    darkTheme?: PrismTheme;
    defaultLanguage?: string;
    additionalLanguages?: string[];
};
export declare type FooterLinkItem = {
    label?: string;
    to?: string;
    href?: string;
    html?: string;
    prependBaseUrlToHref?: string;
};
export declare type FooterLinks = {
    title?: string;
    items: FooterLinkItem[];
};
export declare type Footer = {
    style: 'light' | 'dark';
    logo?: {
        alt?: string;
        src?: string;
        srcDark?: string;
        href?: string;
    };
    copyright?: string;
    links: FooterLinks[];
};
export declare type ThemeConfig = {
    docs: {
        versionPersistence: DocsVersionPersistence;
    };
    navbar: Navbar;
    colorMode: ColorModeConfig;
    announcementBar?: AnnouncementBarConfig;
    prism: PrismConfig;
    footer?: Footer;
    hideableSidebar: boolean;
    image?: string;
    metadatas: Array<Record<string, string>>;
    sidebarCollapsible: boolean;
};
export declare function useThemeConfig(): ThemeConfig;

/** Essentials */
export declare type Primitive = string | number | boolean | bigint | symbol | undefined | null;
/** Dictionaries related */
export declare type Dictionary<T, K extends string | number = string> = {
    [key in K]: T;
};
export declare type DictionaryValues<T> = T extends Dictionary<infer U> ? U : never;
/** Like Partial but recursive */
export declare type DeepPartial<T> = {
    [P in keyof T]?: T[P] extends Primitive ? T[P] : T[P] extends Function ? T[P] : T[P] extends Date ? T[P] : T[P] extends Array<infer U> ? Array<DeepPartial<U>> : T[P] extends ReadonlyArray<infer U> ? ReadonlyArray<DeepPartial<U>> : DeepPartial<T[P]>;
};
/** Like Required but recursive */
export declare type DeepRequired<T> = T extends Primitive ? NonNullable<T> : T extends any[] ? DeepRequiredArray<NonNullable<T[number]>> : T extends Function ? T : T extends {} ? {
    [K in keyof T]-?: DeepRequired<NonNullable<T[K]>>;
} : T;
interface DeepRequiredArray<T> extends Array<DeepRequired<T>> {
}
/** Like Readonly but recursive */
export declare type DeepReadonly<T> = T extends Primitive ? T : T extends (any[] | ReadonlyArray<any>) ? DeepReadonlyArray<T[number]> : T extends Function ? T : T extends {} ? DeepReadonlyObject<T> : unknown;
declare type DeepReadonlyObject<T> = {
    readonly [P in keyof T]: DeepReadonly<T[P]>;
};
interface DeepReadonlyArray<T> extends ReadonlyArray<DeepReadonly<T>> {
}
/** Make readonly object writable */
export declare type Writable<T> = {
    -readonly [P in keyof T]: T[P];
};
/** Like Writable but recursive */
export declare type DeepWritable<T> = T extends Primitive ? T : T extends (any[] | ReadonlyArray<any>) ? WritableArray<T[number]> : T extends Function ? T : DeepWritableObject<T>;
declare type DeepWritableObject<T> = {
    -readonly [P in keyof T]: DeepWritable<T[P]>;
};
interface WritableArray<T> extends Array<DeepWritable<T>> {
}
/**
 * Omit given key in object type
 * @deprecated Starting with TypeScript 3.5, Omit is natively available.
 */
export declare type Omit<T, K extends keyof T> = Pick<T, Exclude<keyof T, K>>;
/** Omit all properties of given type in object type */
export declare type OmitProperties<T, P> = Pick<T, {
    [K in keyof T]: T[K] extends P ? never : K;
}[keyof T]>;
/** Remove keys with `never` value from object type */
export declare type NonNever<T extends {}> = Pick<T, {
    [K in keyof T]: T[K] extends never ? never : K;
}[keyof T]>;
/** Merge 2 types, properties types from the latter override the ones defined on the former type */
export declare type Merge<M, N> = Omit<M, Extract<keyof M, keyof N>> & N;
/** Mark some properties as required, leaving others unchanged */
export declare type MarkRequired<T, RK extends keyof T> = Exclude<T, RK> & Required<Pick<T, RK>>;
/** Convert union type to intersection #darkmagic */
export declare type UnionToIntersection<U> = (U extends any ? (k: U) => void : never) extends ((k: infer I) => void) ? I : never;
/** Easy create opaque types ie. types that are subset of their original types (ex: positive numbers, uppercased string) */
export declare type Opaque<K, T> = T & {
    __TYPE__: K;
};
/** Easily extract the type of a given object's values */
export declare type ValueOf<T> = T[keyof T];
/** Type constraint for tuple inference */
export declare type Tuple<T = any> = [T] | T[];
/** Useful as a return type in interfaces or abstract classes with missing implementation */
export declare type AsyncOrSync<T> = PromiseLike<T> | T;
declare type IsEqualConsideringWritability<X, Y> = (<T>() => T extends X ? 1 : 2) extends (<T>() => T extends Y ? 1 : 2) ? true : false;
declare type IsFullyWritable<T extends object> = IsEqualConsideringWritability<{
    [Q in keyof T]: T[Q];
}, Writable<{
    [Q in keyof T]: T[Q];
}>>;
/** Gets keys of an object which are readonly */
export declare type ReadonlyKeys<T extends object> = {
    [P in keyof T]-?: IsFullyWritable<Pick<T, P>> extends true ? never : P;
}[keyof T];
/** Gets keys of an object which are writable */
export declare type WritableKeys<T extends {}> = {
    [P in keyof T]-?: IsFullyWritable<Pick<T, P>> extends true ? P : never;
}[keyof T];
export {};

import {
  ArrowsExpandIcon,
  BeakerIcon,
  ChartBarIcon,
  ChartPieIcon,
  ChipIcon,
  CloudUploadIcon,
  DuplicateIcon,
  FingerPrintIcon,
  LightningBoltIcon,
  RefreshIcon,
} from "@heroicons/react/outline";
import copy from "copy-to-clipboard";
import Head from "next/head";
import Image from "next/image";
import Link from "next/link";
import toast, { Toaster } from "react-hot-toast";

const features = [
  {
    name: "Incremental builds",
    description: `Building once is painful enough, Turborepo will remember what you've built and skip the stuff that's already been computed.`,
    icon: RefreshIcon,
  },
  {
    name: "Content-aware hashing",
    description: `Turborepo looks at the contents of your files, not timestamps to figure out what needs to be built.`,
    icon: FingerPrintIcon,
  },
  {
    name: "Remote Caching",
    description: `Share a remote build cache with your teammates and CI/CD for even faster builds.`,
    icon: CloudUploadIcon,
  },
  {
    name: "Parallel execution",
    description: `Execute builds using every core at maximum parallelism without wasting idle CPUs.`,
    icon: LightningBoltIcon,
  },
  {
    name: "Zero runtime overhead",
    description: `Turborepo won’t interfere with your runtime code or touch your sourcemaps. `,
    icon: ChipIcon,
  },
  {
    name: "Pruned subsets",
    description: `Speed up PaaS deploys by generating a subset of your monorepo with only what's needed to build a specific target.`,
    icon: ChartPieIcon,
  },
  {
    name: "Task pipelines",
    description: `Define the relationships between your tasks and then let Turborepo optimize what to build and when.`,
    icon: ArrowsExpandIcon,
  },
  {
    name: "Meets you where you’re at",
    description: `Using Lerna? Keep your package publishing workflow and use Turborepo to turbocharge task running.`,
    icon: BeakerIcon,
  },
  {
    name: `Profile in your browser`,
    description: `Generate build profiles and import them in Chrome or Edge to understand which tasks are taking the longest.`,
    icon: ChartBarIcon,
  },
];

function Page() {
  const onClick = () => {
    copy("npx create-turbo@latest");
    toast.success("Copied to clipboard");
  };
  return (
    <>
      <Head>
        <title>Turborepo</title>
        <meta
          name="og:description"
          content="Turborepo is a high-performance build system for JavaScript and
            TypeScript codebases"
        />
      </Head>
      <div className="px-4 pt-16 pb-8 sm:px-6 sm:pt-24 lg:px-8 dark:text-white dark:bg-black ">
        <h1 className="text-center text-6xl font-extrabold tracking-tighter leading-[1.1] sm:text-7xl lg:text-8xl xl:text-8xl">
          Monorepos that
          <br className="hidden lg:block" />
          <span className="inline-block text-transparent bg-clip-text bg-gradient-to-r from-red-500 to-blue-500 ">
            make ship happen.
          </span>{" "}
        </h1>
        <p className="max-w-lg mx-auto mt-6 text-xl font-medium leading-tight text-center text-gray-400 sm:max-w-4xl sm:text-2xl md:text-3xl lg:text-4xl">
          Turborepo is a high-performance build system for JavaScript and
          TypeScript codebases.
        </p>
        <div className="max-w-xl mx-auto mt-5 sm:flex sm:justify-center md:mt-8">
          <div className="rounded-md ">
            <Link href="/docs/getting-started">
              <span className="flex items-center justify-center w-full px-8 py-3 text-base font-medium text-white no-underline bg-black border border-transparent rounded-md dark:bg-white dark:text-black betterhover:dark:hover:bg-gray-300 betterhover:hover:bg-gray-700 md:py-3 md:text-lg md:px-10 md:leading-6">
                Start building →
              </span>
            </Link>
          </div>
          <div className="relative mt-3 rounded-md sm:mt-0 sm:ml-3">
            <button
              onClick={onClick}
              className="flex items-center justify-center w-full px-8 py-3 font-mono text-sm font-medium text-gray-600 bg-black border border-transparent border-gray-200 rounded-md bg-opacity-5 dark:bg-white dark:text-gray-300 dark:border-gray-700 dark:bg-opacity-5 betterhover:hover:bg-gray-50 betterhover:dark:hover:bg-gray-900 md:py-3 md:text-base md:leading-6 md:px-10"
            >
              npx create-turbo
              <DuplicateIcon className="w-6 h-6 ml-2 -mr-3 text-gray-400" />
            </button>
          </div>
        </div>
      </div>

      <div className="relative dark:bg-black from-gray-50 to-gray-100">
        <div className="max-w-4xl px-4 py-16 mx-auto sm:px-6 sm:pt-20 sm:pb-24 lg:max-w-7xl lg:pt-24 lg:px-8">
          <h2 className="text-4xl font-extrabold tracking-tight lg:text-5xl xl:text-6xl lg:text-center dark:text-white">
            Build like the best
          </h2>
          <p className="mx-auto mt-4 text-lg font-medium text-gray-400 lg:max-w-3xl lg:text-xl lg:text-center">
            Turborepo reimagines build system techniques used by Facebook and
            Google to remove maintenance burden and overhead.
          </p>
          <div className="grid grid-cols-1 mt-12 gap-x-6 gap-y-12 sm:grid-cols-2 lg:mt-16 lg:grid-cols-3 lg:gap-x-8 lg:gap-y-12">
            {features.map((feature) => (
              <div
                className="p-10 bg-white shadow-lg rounded-xl dark:bg-opacity-5 "
                key={feature.name}
              >
                <div>
                  <feature.icon
                    className="h-8 w-8 dark:text-white  rounded-full p-1.5 dark:bg-white dark:bg-opacity-10 bg-black bg-opacity-5 text-black"
                    aria-hidden="true"
                  />
                </div>
                <div className="mt-4">
                  <h3 className="text-lg font-medium dark:text-white">
                    {feature.name}
                  </h3>
                  <p className="mt-2 text-base font-medium text-gray-500 dark:text-gray-400">
                    {feature.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
      <div className="dark:bg-black">
        <div className="px-4 py-16 mx-auto sm:px-6 sm:pt-20 sm:pb-24 lg:pt-24 lg:px-8">
          <h2 className="max-w-4xl mx-auto pb-6 text-5xl font-extrabold  tracking-tight lg:text-6xl xl:text-7xl leading-[1.25!important] md:text-center dark:text-white">
            Scaling your monorepo shouldn&apos;t be so difficult
          </h2>
          <div className="max-w-2xl mx-auto lg:mt-2 dark:text-gray-400">
            <p className="mb-6 text-lg leading-normal text-current lg:text-xl">
              Monorepos are incredible for productivity, especially on the
              frontend, but the tooling can be a nightmare. There&apos;s a lot
              of stuff to do (and things to mess up). Nothing &ldquo;just
              works.&rdquo; It&apos;s become completely normal to waste entire
              days or weeks on plumbing—tweaking configs, writing one-off
              scripts, and stitching stuff together.
            </p>
            <p className="mb-6 text-lg leading-normal text-current lg:text-xl">
              We need something else.
            </p>
            <p className="mb-6 text-lg leading-normal text-current lg:text-xl">
              A fresh take on the whole setup. Designed to glue everything
              together. A toolchain that works for you and not against you. With
              sensible defaults, but even better escape hatches. Built with the
              same techniques used by the big guys, but in a way that
              doesn&apos;t require PhD to learn or a staff to maintain.
            </p>
            <p className="mb-6 text-lg leading-normal text-current lg:text-xl">
              <b className="relative inline-block text-transparent bg-clip-text bg-gradient-to-r from-blue-500 to-red-500">
                With Turborepo, we&apos;re doing just that.
              </b>{" "}
              We&apos;re abstracting the complex configuration needed for most
              monorepos into a single cohesive build system—giving you a world
              class development experience without the maintenance burden.
            </p>
          </div>
          <div className="flex items-center max-w-2xl py-4 mx-auto space-x-4">
            <div className="mt-4">
              <Image
                src="/images/people/jaredpalmer_headshot.jpeg"
                height={90}
                width={90}
                className="block mr-6 rounded-full"
                alt="Jared Palmer"
              />
            </div>
            <div className="flex flex-col h-full space-y-3">
              <div className="-mb-4 dark:hidden">
                <Image
                  src="/images/home/jared_signature_2.png"
                  height={75}
                  width={200}
                  alt="Jared Palmer"
                  className="block w-[200px] "
                />
              </div>
              <div className="hidden -mb-4 dark:block">
                <Image
                  src="/images/home/jared_signature.png"
                  height={75}
                  width={200}
                  className="block w-[200px] "
                  alt="Jared Palmer"
                />
              </div>
              <div className="inline-flex items-center ">
                <a
                  href="https://twitter.com/jaredpalmer"
                  target="_blank"
                  className="font-bold text-gray-400 no-underline"
                  rel="noopener noreferrer"
                >
                  Jared Palmer
                </a>
                <div className="ml-2 text-gray-500">Founder of Turborepo</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <Toaster position="bottom-right" />
    </>
  );
}

export default Page;

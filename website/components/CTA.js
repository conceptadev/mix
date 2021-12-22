import { DuplicateIcon } from '@heroicons/react/outline'
import copy from 'copy-to-clipboard'
import Link from 'next/link'
import toast, { Toaster } from 'react-hot-toast'

const CallToAction = () => {
  const onClick = () => {
    copy('flutter pub add mix')
    toast.success('Copied to clipboard')
  }
  return (
    <div className="max-w-xl mx-auto mt-5 sm:flex sm:justify-center md:mt-8">
      <div className="rounded-md ">
        <Link href="/docs/getting-started/basic-usage">
          <a className="flex items-center justify-center w-full px-8 py-3 text-base font-medium text-white no-underline bg-black border border-transparent rounded-md dark:bg-white dark:text-black betterhover:dark:hover:bg-gray-300 betterhover:hover:bg-gray-700 md:py-3 md:text-lg md:px-10 md:leading-6">
            Documentation →
          </a>
        </Link>
      </div>
      <div className="relative mt-3 rounded-md sm:mt-0 sm:ml-3">
        <button
          onClick={onClick}
          className="flex items-center justify-center w-full px-8 py-3 font-mono text-sm font-medium text-gray-600 bg-black border border-transparent border-gray-200 rounded-md bg-opacity-5 dark:bg-white dark:text-gray-300 dark:border-gray-700 dark:bg-opacity-5 betterhover:hover:bg-gray-50 betterhover:dark:hover:bg-gray-900 md:py-3 md:text-base md:leading-6 md:px-10"
        >
          flutter pub add mix
          <DuplicateIcon className="w-6 h-6 ml-2 -mr-3 text-gray-400" />
        </button>
      </div>
      <Toaster position="bottom-right" />
    </div>
  )
}

export default CallToAction

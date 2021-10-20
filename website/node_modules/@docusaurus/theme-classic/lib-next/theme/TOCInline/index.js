/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

/* eslint-disable jsx-a11y/control-has-associated-label */
function HeadingsInline({toc, isChild}) {
  if (!toc.length) {
    return null;
  }

  return (
    <ul className={isChild ? '' : 'table-of-contents'}>
      {toc.map((heading) => (
        <li key={heading.id}>
          <a
            href={`#${heading.id}`} // Developer provided the HTML, so assume it's safe.
            // eslint-disable-next-line react/no-danger
            dangerouslySetInnerHTML={{
              __html: heading.value,
            }}
          />
          <HeadingsInline isChild toc={heading.children} />
        </li>
      ))}
    </ul>
  );
}

function TOCInline({toc}) {
  return (
    <div className={clsx(styles.tableOfContentsInline)}>
      <HeadingsInline toc={toc} />
    </div>
  );
}

export default TOCInline;

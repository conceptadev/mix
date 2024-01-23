import { Button } from "./Button";

import { Features } from "./Features";
import Layout from "./Layout";
import { Logo } from "./Logo";

const HomeContent = () => {
  return (
    <Layout>
      <div className="home-content">
        <div className="content-container">
          <Logo />
          <h1 className="headline">
            Style Widgets
            <br className="" />
            Intuitively
          </h1>
          <p className="subtitle">
            Build your Flutter UI effortlessly
            <br className="sm:block hidden" />
            with a simple declarative syntax.
          </p>

          <div className="not-prose mb-16 mt-6 flex gap-3">
            <Button href="/quickstart" arrow="right">
              <>Getting Started</>
            </Button>
            <Button href="/sdks" variant="outline">
              <>Documentation</>
            </Button>
          </div>
          <Features />
        </div>

        <style jsx>{`
          .content-container {
            margin: 0 auto;
          }
          .headline {
            display: inline-flex;
            font-size: 3.125rem;
            font-size: min(4.375rem, max(8vw, 2.5rem));
            font-weight: 700;
            font-feature-settings: initial;
            letter-spacing: -0.12rem;
            margin-left: -0.2rem;

            line-height: 1.2;
            background-image: linear-gradient(146deg, #000, #757a7d);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
          }
          :global(.dark) .headline {
            background-image: linear-gradient(146deg, #fff, #757a7d);
          }
          .subtitle {
            font-size: 1.6rem;
            font-size: min(1.6rem, max(3.5vw, 1.3rem));
            font-feature-settings: initial;
            line-height: 1.6;
            margin-top: 1.5rem;
          }
          .nextjs-link {
            color: currentColor;
            text-decoration: none;
            font-weight: 600;
          }
        `}</style>
      </div>
    </Layout>
  );
};

export default HomeContent;

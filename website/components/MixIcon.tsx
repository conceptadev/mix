type MixIconProps = {
  size: number
}

export const MixIcon: React.FC<MixIconProps> = ({ size = 20 }) => (
  <svg width={size} height={size} xmlns="http://www.w3.org/2000/svg">
    <defs>
      <linearGradient x1="50%" y1="0%" x2="50%" y2="98.5%" id="a">
        <stop stop-color="#7222CB" offset="0%" />
        <stop stop-color="#502AD0" offset="33.239%" />
        <stop stop-color="#2D88CC" offset="71.405%" />
        <stop stop-color="#48A8D8" offset="100%" />
      </linearGradient>
    </defs>
    <circle
      cx="305.5"
      cy="361.5"
      r="26"
      transform="translate(-279 -335)"
      fill="url(#a)"
      fill-rule="evenodd"
    />
  </svg>
)

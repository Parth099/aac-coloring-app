const config = {
    content: [
        "./app/**/*.{js,ts,jsx,tsx,mdx}", // Note the addition of the `app` directory.
        "./pages/**/*.{js,ts,jsx,tsx,mdx}",
        "./components/**/*.{js,ts,jsx,tsx,mdx}",

        // Or if using `src` directory:
        "./src/**/*.{js,ts,jsx,tsx,mdx}",
    ],
    theme: {
        extend: {},
        fontFamily: {
            inter: ["var(--font-inter)"],
            poppins: ["var(--font-poppins)"],
            scp: ["var(--font-scp)"],
        },
        screens: {
            "2xl-max": { max: "1535px" },
            "xl-max": { max: "1279px" },
            "lg-max": { max: "1023px" },
            "mid-max": { max: "900px" },
            "md-max": { max: "750px" },
            "sm-max": { max: "639px" },
            "xs1-max": { max: "464px" },
            "xs2-max": { max: "380px" },
            "xs3-max": { max: "320px" },
        },
    },
    plugins: [],
};
export default config;

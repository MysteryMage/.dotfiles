local colorizer_ok, colorizer = pcall(require, 'colorizer')
if not colorizer_ok then
    return
end

colorizer.setup(
    {
        '*';
        '!dirbuf';
    },
    {
        RGB =      true;
        RRGGBB =   true;
        names =    true;
        RRGGBBAA = true;
        rgb_fn =   true;
        hsl_fn =   true;
        css =      true;
        css_fn =   true;
    }
)

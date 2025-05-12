using BarcodeScanning;
using Microsoft.Extensions.Logging;
using Mopups.Hosting;
using Mopups.Interfaces;
using Mopups.Services;
using Plugin.Maui.OCR;
using scanner.Controls;
using scanner.Model;
using scanner.Pages;
using scanner.Services.DB;

namespace scanner
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                    fonts.AddFont("FontAwesome.ttf", "FontAwesome");
                    fonts.AddFont("Font Awesome 6 Free-Solid-900.otf", "FontAwesomeSolid");
                    fonts.AddFont("Font Awesome 6 Free-Regular-400.otf", "FontAwesomeRegularSolid");
                    fonts.AddFont("Font Awesome 6  Brands-Regular-400.otf", "FontAwesomeBrandsRegular");
                })
                .ConfigureMopups()
                .UseBarcodeScanning()
                .UseOcr();

#if DEBUG
    		builder.Logging.AddDebug();
#endif
            DatabaseHelper.InitializeDatabase();

            builder.Services.AddSingleton(typeof(IRepository<>),typeof(Repository<>));
            builder.Services.AddSingleton(MopupService.Instance);
            builder.Services.AddSingleton(OcrPlugin.Default);
            builder.Services.AddTransient<MainPage>();
            builder.Services.AddTransient<ToggleControl>();

            return builder.Build();
        }
    }
}

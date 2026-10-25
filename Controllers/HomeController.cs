using Microsoft.AspNetCore.Mvc;
namespace MyMvcLandingPage.Controllers;
public class HomeController : Controller
{
    public IActionResult Index() => View();
}

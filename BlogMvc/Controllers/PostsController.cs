using System.Linq;
using System.Web.Mvc;
using BlogMvc.Models;

namespace BlogMvc.Controllers
{
    public class PostsController : Controller
    {
        public ActionResult Index()
        {
            return View(Post.All().Take(10));
        }

        public ActionResult Archive()
        {
            return View(Post.All());
        }

        public ActionResult Details(string id)
        {
            var path = Request.MapPath("~/Posts/") + id + ".txt";
            if (System.IO.File.Exists(path))
            {
                return View(new Post(path));
            }
            else
            {
                Response.StatusCode = 404;
                return new EmptyResult();
            }
        }
    }
}

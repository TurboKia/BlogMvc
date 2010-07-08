using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using MarkdownSharp;

namespace BlogMvc.Models
{
    public class Post
    {
        public Post(string path)
        {
            string file = File.ReadAllText(path);
            var titleAndBody = Regex.Split(file, "---\r");
            this.Title = titleAndBody[0];
            this.Body = new Markdown().Transform(titleAndBody[1]);
            var regex = Regex.Match(path, @"(\d{4}-\d{2}-\d{2})[^\/]*$");
            this.Date = DateTime.Parse(regex.Groups[1].Value);
            this.Url = regex.Groups[0].Value.Replace(".txt", string.Empty);
        }

        public static IEnumerable<Post> All()
        {
            string postsPath = HttpContext.Current.Request.MapPath("~/Posts");
            return Directory.GetFiles(postsPath).OrderByDescending(p => p).Select(p => new Post(p));
        }

        public string Title { get; private set; }

        public string Body { get; private set; }

        public string Url { get; private set; }
        
        public DateTime Date { get; private set; }
    }
}
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogMvc.Models.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <% if (Model.Any())
       { %>
    <% foreach (var item in Model) { %>
        <% Html.RenderPartial("Post", item); %>
        <hr class="space" />
    <% } %>
    <% } else { %>
    <div class="empty">
        <p class="quiet">...</p>
    </div>
    <% } %>
    
</asp:Content>
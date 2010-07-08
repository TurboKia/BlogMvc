<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogMvc.Models.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Archive
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Model.Any())
       { %>
    <div class="archive">
    <h2>Archive</h2>
    <ul>
    <% foreach (var item in Model) { %>
        <li><%= Html.ActionLink(item.Title, "Details", new { id = item.Url })%></li>
    <% } %>
    </ul>
    </div>
    <% } else { %>
    <div class="empty">
        <p class="quiet">...</p>
    </div>
    <% } %>
</asp:Content>


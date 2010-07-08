<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BlogMvc.Models.Post>" %>
<div class="post">
    <div class="header">
        <h1><%= Html.ActionLink(Model.Title, "Details", new { id = Model.Url })%></h1>
        <p class="date quiet"><%: Model.Date.ToString("dddd, MMMM d yyyy") %></p>
    </div>
    <div class="content">
        <%= Model.Body %>
    </div>
</div>


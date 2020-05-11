<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ImageGallery.ascx.vb"
    Inherits="userControls_ImageGallery" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <div class="brad_crum">
                <a href="<%= App.Value("siteUrl") %>">Home</a> <span>
                    <asp:Literal ID="ltrlTitle1" runat="server" Text="Gallery"></asp:Literal>
                </span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <h1 class="title_02">
                <asp:Literal ID="ltrlTitle2" runat="server" Text="Gallery" /></h1>
        </td>
    </tr>
    <tr>
        <td style="padding-top: 10px;" class="gen_text">
            <div id="tdContent" runat="server" style="width: 932px; min-height: 312px; overflow: auto">
                <asp:Repeater ID="rptNews" runat="server">
                    <HeaderTemplate>
                        <p>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="width: 150px; float: left; padding: 10px; border-radius: 5px 5px 5px 5px; border: 1px solid #E3E1E2; margin:10px;" >
                        <a   href='<%# app.Value("siteUrl") %>GalleryDetail/<%# Eval("strGalleryUrl")%>'
                            title='<%# Eval("strGalleryName") %>'>
                            <img style="height: 100px;" src="<%# app.Value("siteUrl") %>Thumb.aspx?Image=UserFiles/GalleryImages/<%# Eval("strImage") %>&H=100&W=150" />
                              </a>
                        <span>
                        <%# Eval("strGalleryName")%></span>
                        <br />
                        <a style="float:right;" href='<%# app.Value("siteUrl") %>GalleryDetail/<%# Eval("strGalleryUrl")%>'>View</a>
                      </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </p>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </td>
    </tr>
</table>

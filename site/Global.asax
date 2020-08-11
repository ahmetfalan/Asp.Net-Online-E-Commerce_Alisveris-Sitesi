<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script runat="server">
    public void RegisterRoutes(System.Web.Routing.RouteCollection routes)
    {
        // Url yapımız şu şekilde olacak site.com/Tarifler/tarif-adi/{tarifid} 
        // Bu yapıyla gelen hertürlü adresi Tarifdetay.aspx sayfamıza yönlendireceğiz.
        routes.MapPageRoute("urun", "urun/{ad}/{gid}", "~/urun.aspx");
        routes.MapPageRoute("satinal", "satinal/{ad}/{gid}", "~/satinal.aspx");
    }
    void Application_Start(object sender, EventArgs e) 
    {
        RegisterRoutes(System.Web.Routing.RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>

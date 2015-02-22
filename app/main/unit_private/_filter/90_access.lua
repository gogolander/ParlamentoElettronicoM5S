if not app.session.member_id then
    slot.put_into("warning", _"You have to be logged in to access this unit.");
    execute.view {
        module = "index",
        view = "login",
        params = {
            redirect_module = "unit_private",
            redirect_view = "show_ext_bs",
            id = param.get_id(),
            params = param.get_all_cgi()
        }
    }
else
    execute.inner()
end
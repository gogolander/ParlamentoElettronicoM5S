if app.session.member_id then
    if param.get_id() ~= nil then
        if not app.session.member:has_voting_right_for_unit_id(Initiative:by_id(param.get_id()).issue.area.unit.id) then
            slot.put_into("error", _"You don't have accessing rights for this unit.");
        else
            execute.inner()
        end
    elseif param.get("initiative_id") ~= nil then
        if not app.session.member:has_voting_right_for_unit_id(Initiative:by_id(param.get("initiative_id")).issue.area.unit.id) then
            slot.put_into("error", _"You don't have accessing rights for this unit.");
        else
            execute.inner()
        end
    end
else
	slot.put_into("warning", _"You have to be logged in to access this unit.");
	execute.view {
		module = "index",
		view = "login",
		params = {
		    redirect_module = "initiative",
            redirect_view = "show",
            id = param.get_id()
        }
    }
end

slot.select('navbar', function()
    ui.container {
        attr = { class = "row-fluid" },
        content = function()
            ui.container {
                attr = { class = "span12" },
                content = function()
                    ui.link {
                        module = 'index',
                        view = 'index',
                        image = { static = "logo_white.png" },
                        text = ""
                    }
                    --                end
                    --            }

                    --[[ui.container { attr={class="span2 addthis_horizontal_follow_toolbox"}, content = function() slot.put('') end }
                    ui.container {
                        attr = { class = "span2 spaceline " },
                        content = function()
                            slot.put('<a href="http://www.kapipal.com/d92dbc7a90f540d7b98f55c11ba15ab2"')
                            ui.link {
                                content = function()
                                    ui.image { static = "donate.png" }
                                end
                            }
                        end
                    }
                    ui.container {
                        attr = { class = "span2 spaceline " },
                        content = function()
                            slot.put('<a href="http://www.parelon.com/adesione.html"')
                            ui.link {
                                content = function()
                                    ui.image { static = "png/iscriviti.png" }
                                end
                            }
                        end
                    }
                    if app.session.member then
                        ui.container {
                            attr = { class = "span2 spaceline " },
                            content = function()
                                ui.link {
                                    module = 'index',
                                    view = 'search',
                                    content = function()
                                                ui.image { static = "png/search.png" }
                                    end
                                }
                            end
                        }
                    end
        ]]
                    ui.container {
                        attr = { class = "nav pull-right" },
                        content = function()
                            ui.tag {
                                tag = "a",
                                attr = { datatoggle = "dropdown", class = "pull-right spaceline label label-warning fixclick btn-dropdown-toggle" },
                                module = "index",
                                view = "menu_ext",
                                content = function()
                                    if app.session.member_id then
                                        execute.view {
                                            module = "member_image",
                                            view = "_show",
                                            params = {
                                                member = app.session.member,
                                                image_type = "avatar",
                                                show_dummy = true,
                                                class = "micro_avatar",
                                            }
                                        }
                                        slot.put("&nbsp;" .. app.session.member.name)
                                    else
                                        --								ui.tag{ tag ="i" , attr = { class = "iconic black flag" }, content=""}
                                        slot.put("&nbsp;" .. _ "Login")
                                    end
                                end
                            }
                            execute.view { module = "index", view = "_menu_ext" }
                        end
                    }
                end
            }
        end
    }
end)

slot.select("footer_bs", function()
    if app.session.member_id and app.session.member.admin then
        ui.link {
            text = _ "Admin",
            module = 'admin',
            view = 'index'
        }
        slot.put(" &middot; ")
    end
    ui.link {
        text = _ "About site",
        module = 'index',
        view = 'about'
    }
    if config.use_terms then
        slot.put(" &middot; ")
        ui.link {
            text = _ "Use terms",
            module = 'index',
            view = 'usage_terms'
        }
    end
    slot.put(" &middot; ")
    ui.tag { content = _ "This site is using" }
    slot.put(" ")
    ui.link {
        text = _ "LiquidFeedback",
        external = "http://www.public-software-group.org/liquid_feedback"
    }
end)

execute.inner()

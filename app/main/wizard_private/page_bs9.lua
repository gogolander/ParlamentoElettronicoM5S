slot.set_layout("custom")

local area_id=param.get("area_id", atom.integer)
local unit_id=param.get("unit_id", atom.integer)
local area_name=param.get("area_name", atom.string)
local unit_name= param.get("unit_name", atom.string)
local policy_id = param.get("policy_id", atom.integer) or 0
local issue_title = param.get("issue_title", atom.string) or ""
local issue_brief_description = param.get("issue_brief_description", atom.string) or ""
local issue_keywords = param.get("issue_keywords", atom.string) or ""
local problem_description = param.get("problem_description", atom.string) or ""
local aim_description = param.get("aim_description", atom.string) or ""
local initiative_title = param.get("initiative_title", atom.string) or ""
local initiative_brief_description = param.get("initiative_brief_description", atom.string) or ""
local draft = param.get("draft", atom.string) or ""
-- Forzo temporaneamente i valori delle variabili per saltare le pagine 10 e 11
--local technical_area_1 = param.get("technical_area_1", atom.integer) or 0
--local technical_area_2 = param.get("technical_area_2", atom.integer) or 0
--local technical_area_3 = param.get("technical_area_3", atom.integer) or 0
--local technical_area_4 = param.get("technical_area_4", atom.integer) or 0
--local proposer1 = param.get("proposer1", atom.boolean) or false
--local proposer2 = param.get("proposer2", atom.boolean) or false
--local proposer3 = param.get("proposer3", atom.boolean) or false
local technical_areas = param.get("technical_areas", atom.string) or tostring(area_id)
local proposer1 = true
local proposer2 = false
local proposer3 = false

-- trace di controllo sui valori dei parametri
trace.debug( "area_id: "..tostring(area_id) )
trace.debug( "area_name: "..area_name )
trace.debug( "unit_id: "..tostring(unit_id) )
trace.debug( "unit_name: "..tostring(unit_name) )
trace.debug( "policy_id: "..tostring(policy_id) )
trace.debug( "issue_title: "..issue_title )
trace.debug( "issue_brief_description: "..issue_brief_description )
trace.debug( "issue_keywords: "..issue_keywords )
trace.debug( "problem_description: "..problem_description )
trace.debug( "aim_description: "..aim_description )
trace.debug( "initiative_title: "..initiative_title )
trace.debug( "initiative_brief_description: "..initiative_brief_description )
trace.debug( "draft: "..draft )
trace.debug( "technical_areas: "..tostring(technical_areas) )
trace.debug( "proposer1: "..tostring(proposer1) )
trace.debug( "proposer2: "..tostring(proposer2) )
trace.debug( "proposer3: "..tostring(proposer3) ) 

ui.form	{
	method = "post",
	attr = { class = "inline-block", id = "page_bs9" },
	module = 'wizard_private',
	view = 'page_bs10',
	params={
		area_id = area_id,
		unit_id = unit_id,
		area_name = area_name,
		unit_name = unit_name,
		policy_id = policy_id,
		issue_title = issue_title,
		issue_brief_description = issue_brief_description,
		issue_keywords = issue_keywords,
		problem_description = problem_description,
		aim_description = aim_description,
		initiative_title = initiative_title,
		initiative_brief_description = initiative_brief_description,
		draft = draft,
		technical_areas = technical_areas,
		proposer1 = proposer1,
		proposer2 = proposer2,
		proposer3 = proposer3
	},
	routing = {
		ok = {
			mode   = 'redirect',
			module = 'wizard_private',
			view = 'pag_bs10',
			params = {
				area_id = area_id,
				unit_id = unit_id,
				area_name = area_name,
				unit_name = unit_name,
				policy_id = policy_id,
				issue_title = issue_title,
				issue_brief_description = issue_brief_description,
				issue_keywords = issue_keywords,
				problem_description = problem_description,
				aim_description = aim_description,
				initiative_title = initiative_title,
				initiative_brief_description = initiative_brief_description,
				draft = draft,
				technical_areas = technical_areas,
				proposer1 = proposer1,
				proposer2 = proposer2,
				proposer3 = proposer3
			}
		},
		error = {
			mode   = '',
			module = 'index',
			view = 'index',
		}
	}, 
	content = function()
		ui.container{attr={class="row-fluid"},content=function()
			ui.container{attr={class="span12 well"},content=function()
				ui.container{attr={class="row-fluid"},content=function()
				  ui.container{attr={class="span12 text-center"},content=function()
				    ui.heading{level=1, attr={class="uppercase"},content= _"Create new issue"}
				    ui.heading{level=2,attr={class="spaceline"}, content= function()
				      slot.put(_"Unit"..": ".."<strong>"..unit_name.."</strong>" )
				    end }
				    ui.heading{level=2,content= function()
				      slot.put( _"Area"..": ".."<strong>"..area_name.."</strong>" )
				    end }
				  end }
				end }
				ui.container{attr={class="row-fluid spaceline2"},content=function()
				  ui.container{attr={class="span12 depression_box"},content=function()
						ui.container{attr={class="row-fluid"},content=function()
							ui.container{attr={class="span12 text-center"},content=function()
								ui.heading{level=3,content=function() 
									slot.put(_"FASE <strong>9</strong> di 10") 
								end }
								ui.heading{level=4,attr={class="uppercase"},content=  _"Insert the text for your initiative to solve the problem"}
							end }
						end }
				
						ui.container{attr={class="row-fluid"},content=function()
							ui.container{attr={class="span10 offset1 text-center"},content=function()
								ui.container{attr={class="row-fluid"},content=function()
									ui.container{attr={class="span6 pagination-justify alert alert-info collapse", style="height:100%"},content=function()
										ui.tag{tag="p", attr={class="text-center"}, content=  _"Draft text"}
										ui.tag{tag="em",content=  _"Draft note"}
									end }
									ui.tag{
										tag="textarea",
										attr={id="draft",name="draft",class="span6 collapse", style="height:32em; resize:none;"},
										content=draft
									}
								end }
							end }
						end }
						-- Pulsante "Indietro"
						ui.container{attr={class="span3 offset2 text-center"},content=function()
							ui.tag {
								tag = "a",
								attr={id="btnPreviuos",class="btn btn-primary large_btn fixclick", onClick="getElementById(\"page_bs9_back\").submit();"},
								content=function()              
								ui.heading { level=3, content=function()                     
									ui.image{ attr = { class="arrow_medium"}, static="svg/arrow-left.svg"}
									slot.put(_"Back Phase")
								end }
							end }
  					end }
  					-- Pulsante "Avanti"
						ui.container{attr={class="span3 offset2 text-center"},content=function()
							ui.tag {
								tag = "a",
								attr={id="btnNext",class="btn btn-primary large_btn", onClick="getElementById(\"page_bs9\").submit();"},
								content=function()
									ui.heading{ level=3, content=function()
								    slot.put(_"Next Phase")
								    ui.image{ attr = { class="arrow_medium"}, static="svg/arrow-right.svg"}
									end }
							end }
						end }										
					end }
				end }
			end }
		end }
end }

--	ROUTING BACK

ui.form	{
	method = "post",
	attr = { class = "inline-block", id = "page_bs9_back" },
	module = 'wizard_private',
	view = 'page_bs8',
	params={
		area_id = area_id,
		unit_id = unit_id,
		area_name = area_name,
		unit_name = unit_name,
		policy_id = policy_id,
		issue_title = issue_title,
		issue_brief_description = issue_brief_description,
		issue_keywords = issue_keywords,
		problem_description = problem_description,
		aim_description = aim_description,
		initiative_title = initiative_title,
		initiative_brief_description = initiative_brief_description,
		draft = draft,
		technical_areas = technical_areas,
		proposer1 = proposer1,
		proposer2 = proposer2,
		proposer3 = proposer3
	},
	routing = {
		ok = {
			mode   = 'redirect',
			module = 'wizard_private',
			view = 'pag_bs8',
			params = {
				area_id = area_id,
				unit_id = unit_id,
				area_name = area_name,
				unit_name = unit_name,
				policy_id = policy_id,
				issue_title = issue_title,
				issue_brief_description = issue_brief_description,
				issue_keywords = issue_keywords,
				problem_description = problem_description,
				aim_description = aim_description,
				initiative_title = initiative_title,
				initiative_brief_description = initiative_brief_description,
				draft = draft,
				technical_areas = technical_areas,
				proposer1 = proposer1,
				proposer2 = proposer2,
				proposer3 = proposer3
			}
		},
		error = {
			mode   = '',
			module = 'index',
			view = 'index',
		}
	}
}
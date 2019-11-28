module CodeBuildHelper
  include CodeSnippets
  
  def generate_code(build_params)
    base_code = CodeSnippets::BaseCode
    build_params['app'].each do |snippet|
      main_code_block = build_decider(snippet)
      condition_block = condition_builder(snippet['condition']) if snippet['condition']
      if condition_block
        conditioned_main_code_block = format(condition_block, code_block: main_code_block)
        base_code = format(base_code, app_code: conditioned_main_code_block)
      else
        base_code = format(base_code, app_code: main_code_block)
      end
    end
    base_code
  end

  def build_event_changed_api(type)
    format(CodeSnippets::MarketplaceSnippets[:events_changed_api], type: type.to_sym, code_block: "%{code_block}")
  end

  def build_event_clicked_api(type)
    format(CodeSnippets::MarketplaceSnippets[:events_clicked_api], type: type.to_sym, code_block: "%{code_block}")
  end

  def build_data_api(type)
    format(CodeSnippets::MarketplaceSnippets[:data_api], type: type.to_sym, code_block: "%{code_block}")
  end

  def build_non_global_interface_api(type, element)
    format(CodeSnippets::MarketplaceSnippets[:non_global_interface_api][type.to_sym], element: element)
  end

  def build_decider(snippet)
    case snippet['mkpType']
    when "event_changed"
      build_event_changed_api(snippet['type'])
    when "event_clicked"
      build_event_clicked_api(snippet['type'])
    when "data"
      build_data_api(snippet['type'])
    when "non_global_interface"
      build_non_global_interface_api(snippet['type'], snippet['fieldName'])
    end
  end

  def condition_builder(condition)
    if_con = "%{code_block}"
    if condition['criteria']
      fieldName = condition['criteria']['fieldName']
      if condition['criteria']['fromSnippet']
        data_api_snippet = CodeSnippets::MarketplaceSnippets[condition['criteria']['fieldName'].to_sym]
        fieldName = format(data_api_snippet, key: condition['criteria']['key'])
      end
      criteria = format(CodeSnippets::GeneralSnippets[:condition], name: fieldName, operator: condition['criteria']['operator'], value: condition['criteria']['fieldValue'])
      if_con = format(CodeSnippets::GeneralSnippets[:if_clause], condition: criteria, code_block: "%{code_block}")
    end
    case condition['condition_type']
    when "is"
      format(CodeSnippets::MarketplaceSnippets[:data_api], type: condition['type'], code_block: if_con)
    when "when_clicked"
      format(CodeSnippets::MarketplaceSnippets[:events_click_api], type: condition['type'], code_block: if_con)
    when "when_changed"
      format(CodeSnippets::MarketplaceSnippets[:events_changed_api], type: condition['type'], code_block: if_con)
    end
  end
end

type atom_email = string

type atom_name = string

type atom_uri = string

type atom_id = string

type atom_published = string

type atom_updated = string

type atom_author = {
  a_lang : string;
  a_email : atom_email;
  a_name : atom_name;
  a_uri : atom_uri
}

let empty_author = {
  a_lang = "";
  a_email = "";
  a_name = "";
  a_uri = ""
}

type atom_outOfLineContent = {
  oolc_src : string;
  oolc_type : string
}

let empty_content = {
  oolc_src = "";
  oolc_type = ""
}

type atom_category = {
  c_label : string;
  c_scheme : string;
  c_term : string;
  c_lang : string;
}

let empty_category = {
  c_label = "";
  c_scheme = "";
  c_term = "";
  c_lang = ""
}

type atom_generator = {
  g_uri : string;
  g_version : string;
  g_value : string
}

let empty_generator = {
  g_uri = "";
  g_version = "";
  g_value = ""
}

type atom_textConstruct = {
  tc_src : string;
  tc_type : string;
  tc_lang : string;
  tc_value : string
}

let empty_text = {
  tc_src = "";
  tc_type = "";
  tc_lang = "";
  tc_value = ""
}

type atom_contributor = atom_author

type opensearch_itemsPerPage = int

type opensearch_startIndex = int

type app_edited = string


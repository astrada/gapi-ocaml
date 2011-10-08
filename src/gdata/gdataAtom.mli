type atom_email = string

type atom_name = string

type atom_uri = string

type atom_id = string

type atom_published = string

type atom_updated = string

type atom_author =
    { a_lang : string;
      a_email : atom_email;
      a_name : atom_name;
      a_uri : atom_uri }

val empty_author : atom_author

type atom_outOfLineContent =
  { oolc_src : string;
    oolc_type : string }

val empty_content : atom_outOfLineContent

type atom_category =
  { c_label : string;
    c_scheme : string;
    c_term : string;
    c_lang : string }

val empty_category : atom_category

type atom_generator =
  { g_uri : string;
    g_version : string;
    g_value : string }

val empty_generator : atom_generator

type atom_textConstruct =
  { tc_src : string;
    tc_type : string;
    tc_lang : string;
    tc_value : string }

val empty_text : atom_textConstruct

type atom_contributor = atom_author

type opensearch_itemsPerPage = int

type opensearch_startIndex = int

type app_edited = string


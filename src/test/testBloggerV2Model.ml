open OUnit
open GapiLens.Infix
open GapiUtils.Infix
open GapiBloggerV2Model

let test_parse_blog () =
  let blog_json =
    Yojson.Safe.from_file "test_data/test_blogger_blog.json" in
  let tree = GapiJson.json_to_data_model blog_json in
  let blog = Blog.of_data_model tree in
  let tree' = Blog.to_data_model blog in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      blog_json
      json

let test_parse_blog_list () =
  let blog_list_json =
    Yojson.Safe.from_file "test_data/test_blogger_blog_list.json" in
  let tree = GapiJson.json_to_data_model blog_list_json in
  let blog_list = BlogList.of_data_model tree in
  let tree' = BlogList.to_data_model blog_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      blog_list_json
      json

let test_parse_post_list () =
  let post_list_json =
    Yojson.Safe.from_file "test_data/test_blogger_post_list.json" in
  let tree = GapiJson.json_to_data_model post_list_json in
  let post_list = PostList.of_data_model tree in
  let tree' = PostList.to_data_model post_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      post_list_json
      json

let test_parse_post () =
  let post_json =
    Yojson.Safe.from_file "test_data/test_blogger_post.json" in
  let tree = GapiJson.json_to_data_model post_json in
  let post = Post.of_data_model tree in
  let tree' = Post.to_data_model post in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      post_json
      json

let test_parse_comment_list () =
  let comment_list_json =
    Yojson.Safe.from_file "test_data/test_blogger_comment_list.json" in
  let tree = GapiJson.json_to_data_model comment_list_json in
  let comment_list = CommentList.of_data_model tree in
  let tree' = CommentList.to_data_model comment_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      comment_list_json
      json

let test_parse_comment () =
  let comment_json =
    Yojson.Safe.from_file "test_data/test_blogger_comment.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Comment.of_data_model tree in
  let tree' = Comment.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      comment_json
      json

let test_parse_page_list () =
  let page_list_json =
    Yojson.Safe.from_file "test_data/test_blogger_page_list.json" in
  let tree = GapiJson.json_to_data_model page_list_json in
  let page_list = PageList.of_data_model tree in
  let tree' = PageList.to_data_model page_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      page_list_json
      json

let test_parse_page () =
  let page_json =
    Yojson.Safe.from_file "test_data/test_blogger_page.json" in
  let tree = GapiJson.json_to_data_model page_json in
  let page = Page.of_data_model tree in
  let tree' = Page.to_data_model page in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      page_json
      json

let test_parse_user () =
  let user_json =
    Yojson.Safe.from_file "test_data/test_blogger_user.json" in
  let tree = GapiJson.json_to_data_model user_json in
  let user = User.of_data_model tree in
  let tree' = User.to_data_model user in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      user_json
      json

let suite = "Blogger Model test" >:::
  ["test_parse_blog" >:: test_parse_blog;
   "test_parse_blog_list" >:: test_parse_blog_list;
   "test_parse_post_list" >:: test_parse_post_list;
   "test_parse_post" >:: test_parse_post;
   "test_parse_comment_list" >:: test_parse_comment_list;
   "test_parse_comment" >:: test_parse_comment;
   "test_parse_page_list" >:: test_parse_page_list;
   "test_parse_page" >:: test_parse_page;
   "test_parse_user" >:: test_parse_user]


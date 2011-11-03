open GdataUtils.Op

module Comment =
  GdataComment.Make(GdataCalendar.Link)

type calendar_calendarCommentEntry = Comment.commentEntry

let empty_commentEntry = Comment.empty_commentEntry

type calendar_calendarCommentFeed = Comment.commentFeed

let empty_commentFeed = Comment.empty_commentFeed

type calendar_calendarComments = Comment.comments

let empty_comments = Comment.empty_comments


let parse_comments = Comment.parse_comments

let parse_comment_feed = Comment.parse_comment_feed

let parse_comment_entry = Comment.parse_comment_entry

let render_comments = Comment.render_comments

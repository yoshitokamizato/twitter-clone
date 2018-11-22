import React from 'react'

class Tweet extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: this.props.tweet,
      isLiked: this.props.isLiked,
      likedTweetId: this.props.likedTweetId,
      id: this.props.id,
    };
    this.handleLike = this.handleLike.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
  }
  handleLike(likedTweetId) {
    this.props.onLike(likedTweetId);
  }
  handleDelete(id) {
    this.props.onDelete(id);
  }
  render() {
    const tweet = this.state.tweet;
    function date(date, format) {
      if (!format) {
        format = 'YYYY/MM/DD hh:mm:ss'
      }
      format = format.replace(/YYYY/g, date.getFullYear());
      format = format.replace(/MM/g, ('0' + (date.getMonth() + 1)).slice(-2));
      format = format.replace(/DD/g, ('0' + date.getDate()).slice(-2));
      format = format.replace(/hh/g, ('0' + date.getHours()).slice(-2));
      format = format.replace(/mm/g, ('0' + date.getMinutes()).slice(-2));
      format = format.replace(/ss/g, ('0' + date.getSeconds()).slice(-2));
      return format;
    }
    return (
      <div className="tweet">
        <p><span className="user-name">{tweet.user.user_name}</span>　<span className="f-small">{date(new Date(tweet.created_at), 'YYYY/MM/DD hh:mm:ss')}</span></p>
        <p>{tweet.tweet}</p>
        <p><i className="far fa-comment"></i></p>
        <p><span onClick={()=>{this.handleLike(tweet.id)}}>{this.props.isLiked ? <i className="fas fa-heart"></i> : <i className="far fa-heart"></i>}</span></p>
        <p><button onClick={()=>{this.handleDelete(tweet.id)}}>削除</button></p>
      </div>
    );
  }
}

export default Tweet; 
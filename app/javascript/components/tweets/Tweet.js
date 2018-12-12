import React from 'react'

class Tweet extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: this.props.tweet,
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
    // const array = [{id: 1}, {id: 2}, {id: 3}];
    // const ids = array.map(obj => obj.id)
    return (
      <div className="tweet">
        <p><span className="user-name">{tweet.user.user_name}</span>　<span className="f-small">{date(new Date(tweet.created_at), 'YYYY/MM/DD hh:mm:ss')}</span></p>
        <p>{tweet.tweet}</p>
        <ul className="icons">
          <li className="icon"><i className="far fa-comment"></i></li>
          <li className="icon"><span onClick={()=>{this.handleLike(tweet.id)}}>{tweet.is_liked ? <i className="fas fa-heart"></i> : <i className="far fa-heart"></i>}</span></li>
          <li className="icon"><i className="far fa-trash-alt" onClick={()=>{this.handleDelete(tweet.id)}}></i></li>
        </ul>
      </div>
    );
  }
}

export default Tweet; 
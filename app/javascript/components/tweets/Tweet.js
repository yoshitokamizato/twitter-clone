import React from 'react'

class Tweet extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: this.props.tweet
    };
  }
  render() {
    let tweet = this.state.tweet;
    return (
      <div className="tweet">
        <p><b>ユーザー名(ベタ打ち)</b>　<span className="f-small">{tweet.created_at}(後で整形)</span></p>
        <p>{tweet.tweet}</p>
        <p><i className="far fa-comment"></i>　<i className="far fa-heart"></i></p>
      </div>
    );
  }
}

export default Tweet; 
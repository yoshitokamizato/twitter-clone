import React from 'react'
import Tweet from './Tweet'

class Tweets extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: this.props.tweet,
      likedTweetId: this.props.likedTweetId,
      id: this.props.id,
    };
  }
  render() {
    const onLike = this.props.onLike;
    const onDelete = this.props.onDelete;
    const tweets = this.props.tweets.map(function (tweet) {
      return <Tweet tweet={tweet} key={tweet.id} onLike={onLike} onDelete={onDelete} />;
    });
    return (
      <div>
        {tweets}
      </div>
    );
  }
}

export default Tweets;
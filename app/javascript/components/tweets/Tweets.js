import React from 'react'
import Tweet from './Tweet'

class Tweets extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: this.props.tweet
    };
  }
  render() {
    const tweets = this.props.tweets.map(function (tweet) {
      return <Tweet tweet={tweet} key={tweet.id} />;
    });
    const tweetsDesc = tweets.reverse();
    return (
      <div>
        {tweetsDesc}
      </div>
    );
  }
}

export default Tweets;
import React from 'react'
import Tweet from './Tweet'

class Tweets extends React.Component {
  constructor() {
    super();
    this.state = {
      tweets: []
    };
  }
  loadTweetsFromServer() {
    $.ajax({
      url: 'http://localhost:3000/tweets/index.json',
      dataType: 'json',
      type: 'GET',
      success: (data) => {
        console.log(data)
        this.setState({
          tweets: data
        });
      },
      error: (xhr, status, err) => {
        console.error(url, status, err.toString());
      },
    });
  }
  componentDidMount() {
    this.loadTweetsFromServer();
  }
  render() {
    console.log(this.state.tweets)
    const tweets = this.state.tweets.map(function (tweet) {
      return <Tweet tweet={tweet} key={tweet.id} />;
    });
    return (
      <div>
        {tweets}
      </div>
    );
  }
}

export default Tweets;
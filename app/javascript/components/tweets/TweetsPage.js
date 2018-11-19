import React from 'react'
import NewTweet from  './NewTweet'
import Tweets from './Tweets'

class TweetsPage extends React.Component {
  constructor() {
    super();
    this.state = {
      tweets: [],
      tweet: '',
    };
    this.onSubmit2 = this.onSubmit2.bind(this);
  }
  loadTweetsFromServer() {
    const url = 'http://localhost:3000/tweets/index.json';
    $.ajax({
      url: url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: (data) => {
        this.setState({
          tweets: data
        });
      },
      error: (xhr, status, err) => {
        console.error(url, status, err.toString());
      },
    });
  }
  onSubmit2(value) {
    console.log(value)
    const url = 'http://localhost:3000/tweets/create';
    $.ajax({
      url: url,
      dataType: 'text',
      type: 'POST',
      cache: false,
      data: {
        tweet: value
      },
      success: (data) => {
        this.loadTweetsFromServer();
        // this.value = '';
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
    return (
      <div>
        <NewTweet onSubmit1={this.onSubmit2} />
        <Tweets tweets={this.state.tweets} />
      </div>
    );
  }
}

export default TweetsPage;
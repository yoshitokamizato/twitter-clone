import React from 'react'
import NewTweet from  './NewTweet'
import Tweets from './Tweets'

class TweetsPage extends React.Component {
  constructor() {
    super();
    this.state = {
      tweets: [],
      tweet: '',
      likedTweetId: '',
      id: '',
    };
    this.onSubmit2 = this.onSubmit2.bind(this);
    this.onSubmitLike = this.onSubmitLike.bind(this);
    this.onSubmitDelete = this.onSubmitDelete.bind(this);
  }
  loadTweetsFromServer() {
    const url = '/tweets/index.json';
    $.ajax({
      url: url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: (data) => {
        this.setState({
          tweets: data,
        });
      },
      error: (xhr, status, err) => {
        console.error(url, status, err.toString());
      },
    });
  }
  onSubmit2(value) {
    const url = '/tweets/create';
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
      },
      error: (xhr, status, err) => {
        console.error(url, status, err.toString());
      },
    });
  }
  onSubmitLike(likedTweetId) {
    const url = '/likes/create';
    console.log(likedTweetId)
    $.ajax({
      url: url,
      type: 'POST',
      cache: false,
      data: {
        tweet_id: likedTweetId
      },
      success: (data) => {
        this.loadTweetsFromServer();
      },
      error: (xhr, status, err) => {
        console.error(url, status, err.toString());
      },
    });
  }
  onSubmitDelete(id) {
    const url = '/tweets/destroy';
    $.ajax({
      url: url,
      type: 'DELETE',
      cache: false,
      data: {
        id: id
      },
      success: (data) => {
        this.loadTweetsFromServer();
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
        <Tweets tweets={this.state.tweets} onLike={this.onSubmitLike} onDelete={this.onSubmitDelete} />
      </div>
    );
  }
}

export default TweetsPage;
import React from 'react'

class CountUp extends React.Component {
  constructor() {
    super();
    this.state = {
      count: 0
    };
  }
  onClick() {
    this.setState({
      count: this.state.count +1
    });
  }
  onClickReset() {
    this.setState({
      count: 0
    });
  }
  render() {
    return (
      <div>
        <p>{this.state.count}</p>
        <button onClick={this.onClick.bind(this)}>Count Up!</button>
        <button onClick={this.onClickReset.bind(this)}>Reset</button>
      </div>
    );
  }
}

export default CountUp;
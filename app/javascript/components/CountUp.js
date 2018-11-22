import React from 'react'

class CountUp extends React.Component {
  constructor() {
    super();
    this.state = {
      count: 0
    };
    this.onClick = this.onClick.bind(this);
    this.onClickReset = this.onClickReset.bind(this);
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
        <button onClick={this.onClick}>Count Up!</button>
        <button onClick={this.onClickReset}>Reset</button>
      </div>
    );
  }
}

export default CountUp;
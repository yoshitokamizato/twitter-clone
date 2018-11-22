import React from 'react'

class Test extends React.Component {
  constructor() {
    super();
    this.state = {
      click: false
    };
    this.nameChange = this.nameChange.bind(this);
  }
  nameChange() {
    const nameChangeBool = this.state.click;
    this.setState({
      click: !nameChangeBool
    });
  }
  render() {
    return (
      <div>
        <p>{this.state.click ? 'you' : 'me'}</p>
        <button onClick={this.nameChange}>名前入れ替え！</button>
      </div>
    );
  }
}

export default Test;
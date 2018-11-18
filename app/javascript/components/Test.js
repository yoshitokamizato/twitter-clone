import React from 'react'

class Map extends React.component {
  constructor() {
    super();
    this.props = [
      {'id': 1, 'category': 'animal', 'kind': 'dog'},
      {'id': 2, 'category': 'animal', 'kind': 'cat'},
      {'id': 3, 'category': 'animal', 'kind': 'bird'},
    ]
  }
  render() {
    console.log(animals)
    const kinds = animals.map(x => x.kind)
    console.log(kinds)
    return (
      <div>テスト</div>
    );
  }
}

export default Map;
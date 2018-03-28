import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerms: ''
    };
    this.updateSearch = this.updateSearch.bind(this);
    this.click = this.click.bind(this);
  }

  componentDidMount(){
    this.props.fetchSearchGiphys();
  }

  updateSearch(e){
    this.setState({searchTerms: e.target.value});
  }

  click(e){
    e.preventDefault();
    const validSearch = this.state.searchTerms.split(' ').join('+');
    this.props.fetchSearchGiphys(validSearch);
  }

  reset() {
    this.setState({
      searchTerms: ''
    });
  }

  render () {
    return (
      <div id='GiphysSearch'>
        <form>
          <label>Search
            <input type='text' onChange={this.updateSearch} value={this.state.searchTerms} />
          </label>
          <br/>
          <button onClick={this.click}>Submit</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;

import React from 'react';

class SearchBar extends React.Component {
 state = {term: ''};
 //initialize state

 // callback function을 쓸때는 arrow function을 써야 안전하다
 onFormSubmit = (event) => {
  event.preventDefault(); //automatically submitting되는거 막아줌
 
  this.props.onSubmit(this.state.term) //(this.state.term)에서 this는 SearchBar와 같음. function안에 있기 때문에
  // functional component가 아닌 class component에서 props을 쓸때는 앞에 this를 붙여줌
}


  render() {
    return (
    <div className="ui segment">
      <form onSubmit={this.onFormSubmit} className="ui form">
        <div className="field">
          <label>Image Search</label>
          <input
          type="text"
          value={this.state.term}
          onChange={e => this.setState({term: e.target.value})} />
        </div>
      </form>
    </div>
    )
  }
}

export default SearchBar;

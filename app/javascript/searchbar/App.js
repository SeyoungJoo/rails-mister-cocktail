import React from 'react';
import SearchBar from 'SearchBar';
import unsplash from 'unsplash';
import ImageList from 'ImageList';

class App extends React.Component {
  state = { images: [] };
  onSearchSubmit = async (term) => {
    const response = await unsplash.get('/search/photos', {
      params: { query: term }
    });
   
     this.setState({ images: response.data.results });
  };

  render() {
    return (
      <div className="ui container" style={{ marginTop: '10px'}}>
      <SearchBar onSubmit={this.onSearchSubmit}/>
      {/* 얘네들은 다 prop임 그래서 나중에 사용할때 props.onSubmit 이라고함 */}
      <ImageList images={this.state.images}/>
      </div>
    );
  }
} // class 마지막에는 ;이거 지워줌

export default App;

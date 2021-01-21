import axios from 'axios';

export default axios.create ({
  baseURL: 'https://api.unsplash.com',
  headers: {
    Authorization:
      'Client-ID xKtQ6HWW2cUFgoYVQgVdxr1BwqZjg4f_yNFZ8rjb5FY'
  }
});

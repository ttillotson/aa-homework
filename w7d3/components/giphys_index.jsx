import React from 'react';

import GiphysIndexItem from './giphys_index_item';

export default ({ giphys }) => {
  const giphyItems = giphys.map((giphy, index) => (
    <GiphysIndexItem key={index} giphy={giphy} />
  ));

  return(
    <ul>
      {giphyItems}
    </ul>
  );
};

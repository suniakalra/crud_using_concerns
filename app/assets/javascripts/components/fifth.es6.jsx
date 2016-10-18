class Fifth extends React.Component {
  render () {
    return (
      <div>
        <div>Data5: {this.props.data5}</div>
      </div>
    );
  }
}

Fifth.propTypes = {
  data5: React.PropTypes.string
};

class New extends React.Component {
  render () {
    return (
      <div>
        <div>Data6: {this.props.data6}</div>
      </div>
    );
  }
}

New.propTypes = {
  data6: React.PropTypes.string
};

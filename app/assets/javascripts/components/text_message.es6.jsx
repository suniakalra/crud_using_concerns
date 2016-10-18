class TextMessage extends React.Component {
  render () {
    return (
      <div>
        <div>Message: {this.props.message}</div>
      </div>
    );
  }
}

TextMessage.propTypes = {
  message: React.PropTypes.string
};

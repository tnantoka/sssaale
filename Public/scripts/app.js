class App extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            example: {},
            loading: false,
        }
        this.handleChange = this.handleChange.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }
    
    componentDidMount() {
        this.input.focus()
    }

    handleChange(event) {
        const { example } = this.state
        example.input = event.target.value
        this.setState({ example })
    }

    handleSubmit(e) {
        e.preventDefault()
        this.setState({ loading: true })
        const { example } = this.state
        
        const headers = new Headers()
        headers.append('Content-Type', 'application/json')
        fetch('/example', {
            method: 'POST',
            headers: headers,
            body: JSON.stringify(example),
        })
        .then(response => response.json())
        .then(example => {
            this.setState({ example, loading: false })
        })
    }

    render() {
        const { example, loading } = this.state
        return (
            <div>
                <form className="my-4" onSubmit={ this.handleSubmit }>
                    <div className="form-group">
                        <input type="text" className="form-control form-control-lg" value={ example.input } onChange={ this.handleChange } ref={ input => this.input = input } />
                    </div>
                    <div className="form-group">
                        <input type="submit" className="btn btn-secondary btn-block btn-lg" disabled={loading} />
                    </div>
                </form>
                { example.output && <div className="card text-left">
                    <div className="card-block">
                        { example.output }
                    </div>
                </div> }
            </div>
        )
    }
}

ReactDOM.render(<App />, document.querySelector('#app'))

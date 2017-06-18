channel-setting
	input#channel(
		type="text"
		placeholder="channel"
	)
	div#submit(
		onclick="{ onSubmit }"
    )

	style(scoped).
		:scope {
			position: absolute;
			display: block;
			top: 120px;
			width: 380px;
			height: 100px;
			margin: 0 10px;
			margin-bottom: 20px;
		}
		:scope:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope #channel {
			float: left;
			width: 330px;
			height: 50px;
			box-sizing: border-box;
			border: solid 1px #D57774;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			background-color: transparent;
			margin: 0 auto;
			display: block;
			font-size: 18px;
			text-align: center;
			color: #fff;
			transition: all 0.3s ease 0s;
		}
		:scope #channel::-webkit-input-placeholder {
			color: #666;
		}
		:scope #channel:focus {
			outline: none;
			box-shadow: 0 0 10px 5px #000 inset;
		}
		:scope #submit {
			float: right;
			width: 50px;
			height: 50px;
			background-color: #D57774;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			cursor: pointer;
		}

	script(type="coffee").
		@onSubmit = (e) =>
			channel = @root.children[0].value

			if channel is ''
				alert 'チャンネルを入力してください。'

			ipc.send 'set-channel', channel

		ipc.on 'invalid-channel', ->
			alert '接続に失敗しました。確認のうえ、チャンネルを再入力してください。'

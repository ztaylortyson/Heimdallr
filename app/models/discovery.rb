class Discovery < ApplicationRecord

	belongs_to :lawsuit

	enum req_or_resp: { request: 0, response: 1 }
	enum discovery: {
		srog: 0,
		rfp: 1,
		rfa: 2,
		frog_e: 3,
		frog_g: 4
	}
	enum set: { one: 0, two: 1, three: 2, four: 3 }

end
